require "to_partial_path_fix/version"

module ToPartialPathFix
end

module ActiveModel
  module Conversion
    def to_partial_path
      parts = self.class._to_partial_path.split('/')
      pluralized_parts = parts[0..-3].map { |p| p.pluralize }
      "#{pluralized_parts.join('/')}/#{parts.last(2).join('/')}"
    end
  end
end
