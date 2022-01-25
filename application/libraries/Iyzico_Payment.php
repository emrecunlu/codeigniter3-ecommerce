<?php

    class Iyzico_Payment 
    {

        private $options,
                $request;

        private $form,
                $buyer,
                $cart;

        public function __construct ()
        {

            require APPPATH . 'third_party/iyzipay/IyzipayBootstrap.php';

            IyzipayBootstrap::init ();

            $this->options = new \Iyzipay\Options();

            $this -> options->setApiKey("sandbox-RQainLQ0EY0AI5bavKMD7hAr1RZ3efjb");
            $this -> options->setSecretKey("sandbox-xE0Quijxowe8TL0d5b33DQJWUQgvYgSg");
            $this -> options->setBaseUrl("https://sandbox-api.iyzipay.com");

        }

        public function set_form ($data)
        {

            $this -> form = $data;

            return $this;

        }

        public function set_buyer ($data)
        {

            $this -> buyer = $data;

            return $this;

        }

        public function set_cart ($data)
        {

            $this -> cart = $data;

            return $this;

        }
        
        public function send ()
        {

            $this -> request = new \Iyzipay\Request\CreateCheckoutFormInitializeRequest();

            $this -> request->setLocale(\Iyzipay\Model\Locale::TR);
            $this -> request->setConversationId($this -> form['order_id']);
            $this -> request->setPrice($this -> form['total_price']);
            $this -> request->setPaidPrice($this -> form['paid_price']);
            $this -> request->setCurrency(\Iyzipay\Model\Currency::TL);
            $this -> request->setBasketId($this -> form['basket_id']);
            $this -> request->setPaymentGroup(\Iyzipay\Model\PaymentGroup::PRODUCT);
            $this -> request->setCallbackUrl(base_url('payment/new_payment/' . $this -> form['order_id']));
            $this -> request->setEnabledInstallments(array(1));

            $buyer = new \Iyzipay\Model\Buyer();
            $buyer->setId($this -> buyer['id']);
            $buyer->setName($this -> buyer['name']);
            $buyer->setSurname($this -> buyer['surname']);
            $buyer->setGsmNumber($this -> buyer['gsm_number']);
            $buyer->setEmail($this -> buyer['email']);
            $buyer->setIdentityNumber($this -> buyer['tc_number']);
            $buyer->setRegistrationAddress($this -> buyer['address']);
            $buyer->setIp($this -> buyer['ip_address']);
            $buyer->setCity($this -> buyer['city']);
            $buyer->setCountry("Turkey");

            $this -> request->setBuyer($buyer);

            $shippingAddress = new \Iyzipay\Model\Address();
            $shippingAddress->setContactName($this -> buyer ['name']);
            $shippingAddress->setCity($this -> buyer ['city']);
            $shippingAddress->setCountry("Turkey");
            $shippingAddress->setAddress($this -> buyer ['address']);
            $this -> request->setShippingAddress($shippingAddress);

            $billingAddress = new \Iyzipay\Model\Address();
            $billingAddress->setContactName($this -> buyer ['name'] . ' ' . $this -> buyer ['surname']);
            $billingAddress->setCity($this -> buyer ['city']);
            $billingAddress->setCountry("Turkey");
            $billingAddress->setAddress($this -> buyer ['address']);
            $this -> request->setBillingAddress($billingAddress);

            $basketItems = array();
            
            $counter = 0;

            foreach ( $this -> cart as $key => $cart)
            {

                $basketItem = new \Iyzipay\Model\BasketItem();
                $basketItem->setId($cart['rowid']);
                $basketItem->setName($cart['name']);
                $basketItem->setCategory1("Genel");
                $basketItem->setItemType(\Iyzipay\Model\BasketItemType::PHYSICAL);
                $basketItem->setPrice($cart['subtotal']);

                $basketItems[$counter] = $basketItem;

                $counter++;

            }

            $this -> request->setBasketItems($basketItems);

            $checkoutFormInitialize = \Iyzipay\Model\CheckoutFormInitialize::create($this -> request, $this -> options);

            //print_r($checkoutFormInitialize->getStatus()); 
            //print_r($checkoutFormInitialize->getErrorMessage());

            print_r($checkoutFormInitialize->getCheckoutFormContent());

        }

        public function status ( $order_id, $token)
        {

            $this -> request = new \Iyzipay\Request\RetrieveCheckoutFormRequest();
            $this -> request->setLocale(\Iyzipay\Model\Locale::TR);
            $this -> request->setConversationId($order_id);
            $this -> request->setToken($token);

            $checkoutForm = \Iyzipay\Model\CheckoutForm::retrieve($this -> request, $this -> options);

            $status = $checkoutForm -> getStatus ();
            $message = $checkoutForm -> getErrorMessage();

            return array (
                'status' => $status,
                'message' => $message
            );

        }

    }

?>