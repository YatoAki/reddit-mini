class SubsController < ApplicationController

  def index
    @subs = Sub.all
  end
end
