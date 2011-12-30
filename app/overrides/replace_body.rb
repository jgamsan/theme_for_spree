Deface::Override.new(:virtual_path => %q{layouts/spree_application},
                          :name => %q{replace_body},
                          :replace => %q{[data-hook='body']},
                          :closing_selector => %q{},
                          :text => %q{<body id="<%= (@body_id == 'signup' ? 'checkout' : @body_id) || controller.controller_name %>">
    <div id="container">
        <header>
          <%= link_to image_tag("store/logo-nuevo.gif", :width => "219", :height => "68", :alt => "Galiclick 2.0", :id => "logo", :title => "Tu tienda Online de Marcas Blancas"), root_url %>
          <form action="#" >
          </form>
          <%= form_tag products_url, :method => :get do %>
            <input type="search" id="s1" class="empty" name="keywords" placeholder="Buscar Galiclick">
          <% end %>
          <nav>
            <%= link_to "productos", products_path %>
            <% if current_user %>
              <%= link_to t('my_account'), account_path, :class => "cart" %>
              <%= link_to t('logout'), destroy_user_session_path, :class => "cart" %>
            <% else %>
              <%= link_to t('log_in'), login_path, :class => "cart" %>
            <% end %>
            <%= link_to_cart %>
          </nav>
        </header>

        <% if content_for?(:banner) %>
          <div id="banner" role="banner">
            <%= yield :banner %>
          </div>
        <% end %>

        <div id="main" role="main">
          <% if flash.notice %>
            <div class="flash notice"><%= flash.notice %></div>
          <% end %>
          <% if flash[:error] %>
            <div class="flash errors"><%= flash[:error] %></div>
          <% end %>

          <%= yield %>
        </div>

        <% if content_for?(:sidebar) %>
          <div id="sidebar" role="sidebar">
            <%= yield :sidebar %>
          </div>
        <% end %>

    </div>

    <footer data-hook="footer">
      <div class="inner">

        <div id="contact-us">
          <h3>Contacta Nos</h3>
          <p>
          (301)560-2000<br>
          <a href="mailto:info@galiclick.com">info@galiclick.com</a>
          </p>
        </div>

        <div id="social">
          <h3>Social</h3>
          <p>
          <a href="http://facebook.com/galiclick" id="facebook"><span>Facebook</span></a>
          <a href="http://feeds2.feedburner.com/spreehq" id="rss"><span>RSS</span></a>
          <a href="http://twitter.com/galiclick" id="twitter"><span>Twitter</span></a>
          </p>
        </div>

        <div id="menu">
          <h3>Menu</h3>
          <p>
          <a href="/about">About us</a><br />
          <a href="/privacy">Privacy policy</a>
          </p>
        </div>

        <p id="copyright">&copy; Copyright <%= Time.zone.now.year %> Railsdog Radio. All rights reserved</p>

      </div>
    </footer>
</body>})

