<?php

    class File
    {

        private $config;

        /*
         * $config array ()
         * array (
         *    'path' => './public/uploads/',
         *    'file_name' => 'deneme.jpg'
         *  )
         */

        public function initialize ($array)
        {

            $this -> config = $array;

        }

        public function delete ($config = array ())
        {

            if ( !empty( $this -> config)) {

                $config = $this -> config;

                $file = $config ['path'] . '/' . $config ['file_name'];

                if ( file_exists( $file)) {

                    if ( unlink($file)) return true;

                    else return false;

                }

                else return false;

            } else return false;

        }

    }

?>