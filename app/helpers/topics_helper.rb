module TopicsHelper
  def topic_name t
    t.topic.nil? ? "" : Topic.find_by_id(t.topic).name
  end
end
