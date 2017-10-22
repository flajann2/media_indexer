use Amnesia

defdatabase MediaDB do
  deftable Media, [{ :id, autoincrement },
                   :title,
                   :minetype,
                   :filetype,
                   :metadata,
                   :rating,
                   :date_entered,
                   :date_copyrighted], type: :ordered_set, indices: [:title] do

    # Not strictly needed, but we like to be explicit. :)
    @type t :: %Media{id: non_neg_integer,
                      title: String.t,
                      minetype: String.t,
                      filetype: String.t,
                      metadata: String.t,
                      rating: String.t,
                      date_entered: String.t,
                      date_copyrighted: String.t}
    
    @doc """
    Add one or more media entries, as hash objects
    keyed by field names
    """
    def add_media([h | t]) do
    end
    
    def add_media([]) do
      :ok
    end
  end
end
