require "partial_namespaceble/version"

module PartialNamespaceble
  extend ActiveSupport::Concern

  def to_partial_path
    return self.class._to_partial_path_fixed if self.class._to_partial_path_fixed

    original_path = ActiveModel::Conversion.instance_method(:to_partial_path).bind(self).call
    parts = original_path.split('/')
    self.class._to_partial_path_fixed = if parts.length <= 2
                                          original_path
                                        else
                                          pluralized_parts = parts[0..-3].map { |p| p.pluralize }
                                          "#{pluralized_parts.join('/')}/#{parts.last(2).join('/')}".freeze
                                        end
  end

  module ClassMethods
    attr_accessor :_to_partial_path_fixed
  end

end
