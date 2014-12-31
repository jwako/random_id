require 'securerandom'

module RandomId
  module Core

    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def random_id_access(column=RandomId.config.column_name, options={})
        opts = { :length => RandomId.config.default_random_id_length }.merge(options)

        # generate access random_id
        define_method :_generate_access_random_id do
          begin
            self.send("#{column}=", _random_random_id(opts[:length]))
          end while self.class.exists?(column => self[column])
        end
        private :_generate_access_random_id

        self.__send__(:include, Methods)
        self.before_create :_generate_access_random_id
        self.validates_uniqueness_of column
      end
    end

    module Methods
      private

      def _random_random_id(random_id_length)
        SecureRandom.urlsafe_base64 random_id_length
      end
    end

  end
end