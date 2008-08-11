module SourceControl
  class Git
    class Revision < AbstractRevision

      attr_reader :number, :author, :time, :message, :changeset 

      def initialize(number, author = nil, time = nil, message = nil, changeset = nil)
        @number, @author, @time = number, author, time, message, changeset
      end

      def to_s
      	<<-EOL
Revision #{number} committed by #{author} on #{time.strftime('%Y-%m-%d %H:%M:%S') if time}
#{message}
#{changeset ? changeset.collect { |entry| entry.to_s }.join("\n") : nil}
	EOL
      end

      def ==(other)
        other.is_a?(Git::Revision) && number == other.number
      end

    end
  end
end