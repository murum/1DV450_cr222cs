# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include ProjectsHelper
  include UsersHelper
end
