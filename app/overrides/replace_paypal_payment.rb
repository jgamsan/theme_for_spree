Deface::Override.new(:virtual_path => 'checkout/payment/_paypalexpress',
                     :name => 'replace_paypal_payment',
                     :replace => 'a',
                     :text => %q{<li class="payment_method <%= payment_method.id %>" style="display:<%= checked == payment_method.id ? "block" : "none" %>;">
  <h2>Tu Informacion de PayPal</h2>
  <p>Seras redirigido a la web de PayPal cuando pulses continuar.</p>
</li>})

