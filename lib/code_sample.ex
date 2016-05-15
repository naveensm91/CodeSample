defmodule CodeSample do
  @spec get_comments!(String.t, String.t) :: integer
  def get_comments!(file_id, token) do
    case HTTPoison.get! "https://api.box.com/2.0/files/#{file_id}/comments", %{Authorization: "Bearer #{token}"} do
      %{status_code: 200, body: body} ->
        body
        |> Poison.decode!
        |> Map.get("entries")
      %{status_code: code, body: body} ->
        raise "Failed to get comments.  Received #{code}: #{body}"
    end
  end
  @spec update_comments!(String.t, String.t, String.t) :: integer
     def update_comments!(comment_id, token, newmessage) do
        case HTTPoison.put!("https://api.box.com/2.0/comments/#{comment_id}", Poison.encode!(%{message: " #{newmessage}"}),%{Authorization: "Bearer #{token}"}) do
         %{status_code: 200} ->
          IO.puts "Comment updated successfully"
         %{status_code: code, body: body} ->
                 raise "Failed to update comments.  Received #{code}: #{body}"
        end
      end

  @spec delete_comments!(String.t, String.t) :: integer
  def delete_comments!(comment_id, token) do
        case HTTPoison.delete!("https://api.box.com/2.0/comments/#{comment_id}" ,%{Authorization: "Bearer #{token}"}) do
        %{status_code: 204} ->
           IO.puts "Comment deleted successfully"
        %{status_code: code, body: body} ->
            raise "Failed to delete comments.  Received #{code}: #{body}"
            end
  end

#{"item": {"type": "file", "id": "65031347569"}, "message": "This is a test message"}'

    @spec create_comments!(String.t, String.t, String.t) :: integer
        def create_comments!(file_id, token, newmessage) do
           case HTTPoison.post!("https://api.box.com/2.0/comments/",  Poison.encode!(%{item: %{type: "file", id: "#{file_id}"}, message: "#{newmessage}"}),[{"Authorization", "Bearer #{token}"}]) do
              %{status_code: 201} ->
                IO.puts "Comment created successfully"
                      %{status_code: code, body: body} ->
                          raise "Failed to create comments.  Received #{code}: #{body}"
              end
            end
end



