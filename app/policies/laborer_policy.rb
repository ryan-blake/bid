# class LaborerPolicy < ApplicationPolicy
#   attr_reader :current_laborer, :laborer
#
#   def initialize(current_laborer, laborer)
#     @current_laborer = current_laborer
#     @laborer = laborer
#   end
#
#   def show?
#     current_laborer == laborer || laborer.admin?
#   end
#
#   def update?
#     laborer.admin? or not post.published?
#   end
# end
