require 'google/apis/gmail_v1'
# require 'google/api_client/client_secrets'
module Email
  Gmail = Google::Apis::GmailV1 # Alias the module
  service = Gmail::GmailService.new
  def findProvider(user,number)
    bounced_numbers=[]
    # Initialize client with authorization
    service.authorization = user.access_token
    # Gets bounced label Id
    label_id = service.list_user_labels("me").to_h[:labels].find{|label|label[:name]==="bounced"}[:id]
    #Gets array with Message Ids only, filters from bounced label only and not sent
    messages_list = service.list_user_messages("me",{include_spam_trash:true,label_ids:label_id, q:"-SENT"}).to_h[:messages].map{|message|message[:id]}
    messages_list.each{|message|
      match = service.get_user_message("me",message).payload.headers
      bounced_numbers << match.find{|el|el.name ==="To"}.value
    }



    #scan email body for To: and grabs everything until return - 11111111111@vtext.com
    x.scan(/To:([^>]*) \\r/).last.first.strip


end
