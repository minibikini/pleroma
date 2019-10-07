defmodule Pleroma.Web.SuperAdmin do
  def config do
    %{
      base_path: "/pleroma/adm/",
      repo: Pleroma.Repo,
      resources: [
        %{
          path: "users",
          scheme: Pleroma.User,
          name: "Users",
          index: %{
            body: [
              %{key: :nickname, link: :show, pizda1111: :piz},
              :ap_id,
              :email,
              :local,
              %{key: [:info, :note_count], title: "Notes"},
              %{key: [:info, :follower_count], title: "Followers"},
              %{title: "Following", format: &following_count/2},
              [:info, :locked]
            ]
          },
          show: %{
            body: [
              %{key: :nickname, link: :show, pizda1111: :piz},
              :name,
              :ap_id,
              %{key: [:avatar, "url", 0, "href"], title: "Avatar", format: :image},
              %{key: :bio, title: "Avatar", format: :raw_html},
              :email,
              :local,
              %{key: [:info, :note_count], title: "Notes"},
              %{key: [:info, :follower_count], title: "Followers"},
              %{title: "Following", format: &following_count/2},
              [:info, :locked]
            ]
          }
        }
      ]
    }
  end

  def following_count(_, user), do: Pleroma.User.following_count(user)
end
