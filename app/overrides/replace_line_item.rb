Deface::Override.new(:virtual_path => %q{orders/_line_item},
                          :name => %q{replace_line_item},
                          :replace => %q{tr},
                          :text => %q{<tr class="<%= cycle('', 'alt') %>">
  <td data-hook="cart_item_image">
    <% if variant.images.length == 0 %>
      <%= small_image(variant.product) %>
    <% else %>
      <%=  image_tag variant.images.first.attachment.url(:small)   %>
    <% end %>
  </td>
  <td class="description" data-hook="cart_item_description">
    <h4><%= link_to variant.product.name,  product_path(variant.product) %></h4>
    <%= variant_options variant %>
  </td>
  <td class="unit-price" data-hook="cart_item_price">
    <%= product_price(line_item) %>
  </td>
  <td class="operator">
    X
  </td>
  <td class="quantity" data-hook="cart_item_quantity">
    <%= item_form.text_field :quantity, :size => 3, :class => "line_item_quantity" %>
  </td>
  <td class="operator">
    =
  </td>
  <td class="total" data-hook="cart_item_total">
    <%= format_price(product_price(line_item, :format_as_currency => false) * line_item.quantity) unless line_item.quantity.nil? %>
  </td>
  <td class="total" data-hook="cart_item_delete">
    <%= link_to("Eliminar", '#', :class => 'delete button'), :id => "delete_#{dom_id(line_item)}" %>
  </td>
</tr>})

