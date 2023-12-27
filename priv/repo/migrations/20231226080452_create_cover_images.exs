defmodule Blog.Repo.Migrations.CreateCoverImages do
  use Ecto.Migration

  def change do
    create table(:cover_images) do
      add :url, :text
      add :post_id, references(:posts, on_delete: :delete_all, type: :binary_id)

      timestamps(type: :utc_datetime)
    end

    create index(:cover_images, [:post_id])
  end
end
