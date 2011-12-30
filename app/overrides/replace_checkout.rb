Deface::Override.new(:virtual_path => %q{checkout/edit},
                          :name => %q{replace_checkout},
                          :replace => %q{#checkout[data-hook]},
                          :closing_selector => %q{},
                          :text => %q{<div id="checkout" role="checkout" class="clearfix">
  <div id="title" role="title">CHECKOUT</div>
  <!-- START MAIN CONTENT -->
  <div id="main-content" role="main-content">
    <%= render "shared/error_messages", :target => @order %>
    <div id="tabs" role="tabs">
      <ul>
        <li><span class="number">1</span><span class="title">Crear una Cuenta</span></li>
        <li <%= @order.address?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">2</span><span class="title">Tu Direccion</span></li>
        <li <%= @order.delivery?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">3</span><span class="title">Opciones Envio</span></li>
        <li <%= @order.payment?  && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">4</span><span class="title">Opciones Pago</span></li>
        <li <%= @order.confirm? && controller.action_name != "registration" ? "class='active'" : "" %>><span class="number">5</span><span class="title">Situacion Orden</span></li>
      </ul>
    </div>
    <%= form_for @order, :url => update_checkout_path(@order.state) do |form| %>
      <%= render @order.state, :form => form %>
    <% end %>
  </div>
  <!-- END MAIN CONTENT -->
  <%= render 'summary' %>
</div>})

