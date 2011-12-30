 Deface::Override.new(:virtual_path => %q{user_registrations/new},
                          :name => %q{replace_user_registration_new},
                          :replace => %q{#new-customer},
                          :text => %q{<div id="new_customers">
    <h2>Nuevo Cliente</h2>
    <p>Tu puedes registrarte para abrir una nueva cuenta mas abajo:</p>
    <%= form_for(:user, :url => registration_path(User.new)) do |f| %>
      <%= render 'shared/user_form', :f => f %>
      <p>
        <button type="submit">Registrarse</button>
      </p>
    <% end %>
  </div>})

