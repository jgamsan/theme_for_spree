Deface::Override.new(:virtual_path => %q{orders/edit},
                          :name => %q{replace_outside_cart_form},
                          :replace => %q{[data-hook='outside_cart_form']},
                          :closing_selector => %q{},
                          :text => %q{<%= form_for(@order, :url => update_cart_path, :html=>{:id=>'updatecart'}) do |order_form| %>

    <h3>Tu tienes <%= pluralize @order.line_items.length, 'articulos' %> en tu pedido</h3>

    <div data-hook="cart_items">
      <%= render :partial => 'form', :locals => {:order_form => order_form} %>
    </div>

    <p class="actions">
      <%=link_to t("continue_shopping"), products_path, :class => 'continue' %> &nbsp; o &nbsp;
      <%= link_to t("checkout"), checkout_path, :class => 'button checkout' %>
    </p>

  <% end %>},
                          :disabled => false,
                          :sequence => 100)

