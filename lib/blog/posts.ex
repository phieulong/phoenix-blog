defmodule Blog.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Hex.Repo
  alias Hex.Repo
  alias Blog.Repo

  alias Blog.Posts.Post

  @doc """
  Returns the list of posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts(param) do
    search_by_title = fn(query) ->
      if is_binary(param["title"]) && param["title"] != "" do
        from p in query, where: like(fragment("lower(?)", p.title), ^"%#{String.downcase(param["title"])}%")
      else
        query
      end
    end

    search_by_content = fn(query) ->
      if is_binary(param["content"]) && param["content"] != "" do
        from p in query, where: like(fragment("lower(?)", p.content), ^"%#{String.downcase(param["content"])}%")
      else
        query
      end
    end

    search_by_visibility = fn(query) ->
      if param["visibility"] == "true" do
        visibility = param["visibility"]
        from p in query, where: p.visibility == ^visibility
      else
        query
      end
    end

    arc_sort_by_published_on= fn(query) ->
      if param["arc_sort"] == "true" do
        IO.puts(param["arc_sort"])
        from p in query, order_by: [asc: p.published_on]
      else
        from p in query, order_by: [desc: p.published_on]
      end
    end

    query = from p in Post
    query
    |> search_by_title.()
    |> search_by_content.()
    |> search_by_visibility.()
    |> arc_sort_by_published_on.()
    |> Repo.all()
  end

  @doc """
  Gets a single post.

  Raises `Ecto.NoResultsError` if the Post does not exist.

  ## Examples

      iex> get_post!(123)
      %Post{}

      iex> get_post!(456)
      ** (Ecto.NoResultsError)

  """
  def get_post!(id), do: Repo.get!(Post, id)

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{data: %Post{}}

  """
  def change_post(%Post{} = post, attrs \\ %{}) do
    Post.changeset(post, attrs)
  end
end
