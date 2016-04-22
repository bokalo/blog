class AdminController < ApplicationController

before_filter :check_if_admin
layout "admin"


def show

end

end
