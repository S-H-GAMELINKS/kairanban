class WebController < ApplicationController
  def index
    @examples = Example.all
  end

  def about
  end

  def contact
  end
end
