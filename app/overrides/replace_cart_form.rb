Deface::Override.new(:virtual_path => %q{products/show},
                          :name => %q{replace_cart_form},
                          :replace => %q{[data-hook='cart_form']},
                          :closing_selector => %q{},
                          :text => %q{<div id="cart-form" data-hook="cart_form">
    <%= form_for :order, :url => populate_orders_url do |f| %>

      <% if product_price(@product) %>
        <%= hidden_field_tag (@product.has_variants? ? :quantity : "variants[#{@product.master.id}]"), 1, :class => "title", :size => 3 %>

        <dl class="part-numbers clearfix">
          <dt>CODIGO ARTICULO</dt>
          <dd><%= @product.sku %></dd>
        </dl>
        <dl class="prices clearfix">
          <dt>Precio</dt>
          <dd><span class="price discounted"><%= number_to_currency @product.cost_price %></span></dd>
          <dt>Precio Venta</dt>
          <dd><span class="price selling"><%= product_price(@product) %></span></dd>
          <!-- #Coming soon
            <dt>after $xx.00 rebate</dt>
            <dd><span class="price">$xx.99</span></dd>
          -->
        </dl>
        <dl class="shipping">
          <dt>Envio</dt>
          <dd><span class="price">SIN GASTOS</span></dd>
        </dl>
        <dl class="stock">
          <dt>En Stock</dt>
          <dd><span class="stock"><%= @product.has_stock? ? "YES" : "NO" %></span></dd>
        </dl>
        <hr />

      <% end %>


      <hr />

      <p><button type="submit">Aňadir al pedido</button></p>
    <% end %>

</div>},
                          :disabled => true)

