<?php

namespace App\Controller;

use App\Classe\Cart;
use App\Repository\OrderRepository;
use Doctrine\ORM\EntityManagerInterface;

use Stripe\Checkout\Session;
use Stripe\Stripe;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;





class PaymentController extends AbstractController
{
    #[Route('/commande/paiement/{id_order}', name: 'app_payment')]
    public function index($id_order, OrderRepository $orderRepository, EntityManagerInterface $entityManager): Response
    {
        Stripe::setApiKey($_ENV['STRIPE_SECRET_KEY']);

        $products_for_stripe = [];
        //$order = $orderRepository->findOneById($id_order);

        $order = $orderRepository->findOneBy([
             'id' => $id_order,
             'user' => $this->getUser()
         ]);

        if(!$order){
            return $this->redirectToRoute('app_home');
        }

        foreach ($order->getOrderDetails() as $product) {
            $products_for_stripe [] = [
                'price_data' => [
                    'currency' => 'eur',
                    'unit_amount' => number_format($product->getProductPriceWt() * 100, 0,'',''),
                    'product_data' => [
                        'name' => $product->getProductName(),
                        'images' => [
                            $_ENV['DOMAIN'] . '/uploads/' . $product->getProductIllustration(),
                        ]
                    ],

                ],

                'quantity' => $product->getProductQuantity()

            ];
        }

        $products_for_stripe[] = [
            'price_data' => [
                'currency' => 'eur',
                'unit_amount' => number_format($order->getCarrierPrice() * 100, 0, '', ''),
                'product_data' => [
                    'name' => 'Transporteur : '.$order->getCarrierName(),
                ]
            ],
            'quantity' => 1,
        ];


        // dd($products_for_stripe);

        $checkout_session = Session::create([
            'customer_email' => $order->getUser()->getEmail(),
            'line_items' => [[
                $products_for_stripe
            ]],
            'mode' => 'payment',
            'success_url' => $_ENV['DOMAIN'] . '/commande/merci/{CHECKOUT_SESSION_ID}',
            'cancel_url' => $_ENV['DOMAIN'] . '/mon-panier/annulation',

        ]);

        // dd($checkout_session);
        // dd($products_for_stripe);

        $order->setStripeSessionId($checkout_session->id);
        $entityManager->flush();


        return $this->redirect($checkout_session->url);
    }

    #[Route('/commande/merci/{stripe_session_id}', name: 'app_payment_success')]
    public function success($stripe_session_id, OrderRepository $orderRepository, EntityManagerInterface $entityManager, Cart $cart): Response
    {
        $order = $orderRepository->findOneBy([
            'stripe_session_id' => $stripe_session_id,
            'user' => $this->getUser()
        ]);

        if(!$order){
            return $this->redirectToRoute('app_home',[
                'order' => $order,
            ]);
        }

        if($order->getState() == 1){
            $order->setState(2);
            $cart->remove();
            $entityManager->flush();
        }

        return $this->render('payment/success.html.twig', [
            'order' => $order,
        ]);
    }
}
