module InstagramBasicDisplayAPI
  class Client
    module Users
      def user(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        id = args.first || 'me'
        fields = options[:fields] || 'id,account_type,media_count,username'
        response = connection.get("#{id}?fields=#{fields}&access_token=#{access_token}")
        response.body
      end

      def user_recent_media(*args)
        options = args.last.is_a?(Hash) ? args.pop : {}
        id = args.first || 'me'
        fields = options[:fields] || 'id,caption,media_type,media_url,permalink,thumbnail_url,timestamp,username,children'
        limit = options[:limit] || ''
        after = options[:after] || ''
        url = "#{id}/media?fields=#{fields}&access_token=#{access_token}&limit=#{limit}&after=#{after}"
        response = connection.get(url)
        response.body
      end
    end
  end
end
