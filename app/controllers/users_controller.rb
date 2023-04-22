class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @attached_file = AttachedFile.new
  end
end
