class PagesController < ApplicationController
  layout 'pages_layout'
  def index
    redirect_to mailboxes_path if current_user
  end

  def help
  end

  def terms
  end
end
