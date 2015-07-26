require "to_partial_path_fix/version"

module ToPartialPathFix
end

module ActiveModel
  module Conversion
    def to_partial_path
      original_path = self.class._to_partial_path
      parts = original_path.split('/')
      return original_path if parts.length == 2
      pluralized_parts = parts[0..-3].map { |p| p.pluralize }
      "#{pluralized_parts.join('/')}/#{parts.last(2).join('/')}".freeze
    end
  end
end
