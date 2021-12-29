    <div class="user__adress">
        <p>Yeni Adres</p>
        <?php echo form_open(base_url('user/add_adress')); ?>
            <div class="input__group">
                <label for="adress-title">Adres Başlığı</label>
                <input type="text" name="adress_title" id="adress-title" required>
            </div>
            <div class="flex__group">
                <div class="input__group">
                    <label for="user-name">İsim Soyisim</label>
                    <input type="text" name="user_name" id="user-name" required>
                </div>
                <div class="input__group">
                    <label for="user-tel">Cep Telefonu</label>
                    <input type="text" name="user_tel" id="user-tel" required>
                </div>
            </div>
            <div class="flex__group">
                <div class="input__group">
                    <label for="user-city">Şehir</label>
                    <select name="user_city" id="user-city" required>
                        <option value="">Şehir seçiniz...</option>
                        <?php foreach ($cities as $city) : ?>
                        <option value="<?=$city -> sehir_id?>" city-key="<?=$city -> sehir_key;?>"><?=$city -> sehir_title;?></option>
                        <?php endforeach; ?>
                    </select>
                </div>
                <div class="input__group">
                    <label for="user-district">İlçe</label>
                    <select name="user_district" id="user-district" required>
                        <option value="" class="default-option">İlçe seçiniz...</option>
                    </select>
                </div>
            </div>
            <div class="flex__group">
                <div class="input__group">
                    <label for="user-adress">Adres</label>
                    <textarea name="user_adress" id="user-adress"></textarea required>
                </div>
                <div class="input__group">
                    <label for="user-tc">T.C Kimlik No</label>
                    <input type="text" name="user_tc" id="user-tc" required>
                </div>
            </div>
            <button type="submit">EKLE</button>
        <?php form_close(); ?>
    </div>