# encoding: utf-8
# ======个人主页
class ProfilesController < ApplicationController
   before_filter :authenticate_user!
   layout 'profiles'
  def show
  end
end
