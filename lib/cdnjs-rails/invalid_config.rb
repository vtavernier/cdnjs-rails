module CDNJS
  # Exception raised when a configuration entry for a library is invalid
  class InvalidConfig < StandardError
    attr_reader :library

    def initialize(library)
      @library = library
      super("Invalid configuration for library #{library.inspect}")
    end
  end
end