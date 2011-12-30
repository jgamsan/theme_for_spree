Deface::Override.new(:virtual_path => %q{user_sessions/new},
                          :name => %q{replace_user_sessions_new},
                          :replace => %q{#existing-customer},
                          :text => %q{
<% if Rails.application.railties.all.map(&:railtie_name).include? "spree_social" %>
<%= render 'shared/social_users' %>
<% end %>
<div id="local_login">

  <div id="existing-customer">
    <h2>Cliente Existente</h2>
    <p>Si ya te has registrado en una cuenta, puedes entrar aqui:</p>
    <%= render :partial => 'shared/login' %>
  </div>

  <hr/>

  <div id="new_customers">
    <h2>Nuevo Cliente</h2>
    <p>Tu puedes registrarte en una nueva cuenta para Galiclick mas abajo:</p>
    <%= form_for(:user, :url => registration_path(User.new)) do |f| %>

        <% if session[:omniauth] %>
          <p>
            <%= f.label :email, t("email") %>
            <%= f.text_field :email, :class => 'title'  %>
          </p>
        <% else %>
          <%= render 'shared/user_form', :f => f %>
        <% end %>
        <p>
          <button type="submit">Registrarse</button>
        </p>
      <% end %>


  </div>
</div>
})

