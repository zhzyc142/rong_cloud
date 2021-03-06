module RongCloud
  module Services
    # 聊天室服务相关接口 http://www.rongcloud.cn/docs/server.html#聊天室服务
    module Chatroom
      # 创建聊天室，支持同时创建多个聊天室 http://www.rongcloud.cn/docs/server.html#创建聊天室_方法
      #
      # @param chatrooms [Hash] id 为 key，聊天室名称为 value 的 Hash 实例，多个 key-value 表示多个聊天室
      #
      def create_chatroom(chatrooms)
        params = {}
        chatrooms.each { |room_id, room_name| params["chatroom[#{room_id}]"] = room_name }

        request("/chatroom/create", params)
      end

      # 加入聊天室 http://www.rongcloud.cn/docs/server.html#加入聊天室_方法
      #
      # @param user_id [String, Array] 一个或多个用户 id
      # @param chatroom_id [String] 聊天室 id
      #
      def join_chatroom(user_id, chatroom_id)
        request("/chatroom/join", userId: user_id, chatroomId: chatroom_id)
      end

      # 销毁聊天室 http://www.rongcloud.cn/docs/server.html#销毁聊天室_方法
      #
      # @param chatroom_ids [String, Array] 一个或多个聊天室 id
      #
      def destroy_chatroom(chatroom_ids)
        request("/chatroom/destroy", chatroomId: chatroom_ids)
      end

      # 查询聊天室信息 http://www.rongcloud.cn/docs/server.html#查询聊天室信息_方法
      #
      # @param chatroom_ids [String, Array] 一个或多个聊天室 id
      #
      def query_chatroom(chatroom_ids)
        request("/chatroom/query", chatroomId: chatroom_ids)
      end

      # 添加禁言聊天室成员 http://www.rongcloud.cn/docs/server.html#添加禁言聊天室成员_方法
      #
      def block_chatroom_user(chatroom_id, user_id, minute)
        request("/chatroom/user/gag/add", chatroomId: chatroom_id, userId: user_id, minute: minute)
      end

      # 移除封禁聊天室成员 http://www.rongcloud.cn/docs/server.html#移除封禁聊天室成员_方法
      #
      def unblock_chatroom_user(chatroom_id, user_id)
        request("/chatroom/user/block/rollback", chatroomId: chatroom_id, userId: user_id)
      end

      # 查询被封禁聊天室成员 http://www.rongcloud.cn/docs/server.html#查询被封禁聊天室成员_方法
      #
      def blocked_chatroom_users(chatroom_id)
        request("/chatroom/user/block/list", chatroomId: chatroom_id)
      end

      # 查询聊天室内用户
      #
      # @param chatroom_id [String] 聊天室 id
      # @param count [String, Fixnum] 要获取的聊天室成员数，上限为 500
      # @param order [String] 加入聊天室的先后顺序， 1 为加入时间正序， 2 为加入时间倒序
      #
      def query_chatroom_users(chatroom_id, count, order = "1")
        request("chatroom/user/query", chatroomId: chatroom_id, count: count, order: order)
      end

      # 聊天室消息停止分发 http://www.rongcloud.cn/docs/server.html#聊天室消息停止分发_方法
      #
      def stop_chatroom_distribution(chatroom_id)
        request("/chatroom/message/stopDistribution", chatroomId: chatroom_id)
      end

      # 聊天室消息恢复分发 http://www.rongcloud.cn/docs/server.html#聊天室消息恢复分发_方法
      #
      def resume_chatroom_distribution(chatroom_id)
        request("/chatroom/message/resumeDistribution", chatroomId: chatroom_id)
      end

      # 添加聊天室白名单成员 http://www.rongcloud.cn/docs/server.html#添加聊天室白名单成员_方法
      #
      def add_chatroom_whitelist(chatroom_id, user_id)
        request("/chatroom/user/whitelist/add", chatroomId: chatroom_id, userId: user_id)
      end

      # 移除聊天室白名单成员 http://www.rongcloud.cn/docs/server.html#移除聊天室白名单成员_方法
      def remove_chatroom_whitelist(chatroom_id, user_id)
        request("/chatroom/user/whitelist/remove", chatroomId: chatroom_id, userId: user_id)
      end

      # 查询聊天室白名单成员 http://www.rongcloud.cn/docs/server.html#查询聊天室白名单成员_方法
      def whitelisted_chatroom_users(chatroom_id)
        request("/chatroom/user/whitelist/query", chatroomId: chatroom_id)
      end
    end
  end
end