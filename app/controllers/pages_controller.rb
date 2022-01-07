# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :authorize_session!
end
