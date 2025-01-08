// @generated
// This file was automatically generated and should not be edited.

import ApolloAPI

public protocol SelectionSet: ApolloAPI.SelectionSet & ApolloAPI.RootSelectionSet
where Schema == Pokeapi.SchemaMetadata {}

public protocol InlineFragment: ApolloAPI.SelectionSet & ApolloAPI.InlineFragment
where Schema == Pokeapi.SchemaMetadata {}

public protocol MutableSelectionSet: ApolloAPI.MutableRootSelectionSet
where Schema == Pokeapi.SchemaMetadata {}

public protocol MutableInlineFragment: ApolloAPI.MutableSelectionSet & ApolloAPI.InlineFragment
where Schema == Pokeapi.SchemaMetadata {}

public enum SchemaMetadata: ApolloAPI.SchemaMetadata {
  public static let configuration: any ApolloAPI.SchemaConfiguration.Type = SchemaConfiguration.self

  public static func objectType(forTypename typename: String) -> ApolloAPI.Object? {
    switch typename {
    case "pokemon_v2_ability": return Pokeapi.Objects.Pokemon_v2_ability
    case "pokemon_v2_pokemon": return Pokeapi.Objects.Pokemon_v2_pokemon
    case "pokemon_v2_pokemonability": return Pokeapi.Objects.Pokemon_v2_pokemonability
    case "pokemon_v2_pokemoncries": return Pokeapi.Objects.Pokemon_v2_pokemoncries
    case "pokemon_v2_pokemonspecies": return Pokeapi.Objects.Pokemon_v2_pokemonspecies
    case "pokemon_v2_pokemonspeciesflavortext": return Pokeapi.Objects.Pokemon_v2_pokemonspeciesflavortext
    case "pokemon_v2_pokemonsprites": return Pokeapi.Objects.Pokemon_v2_pokemonsprites
    case "pokemon_v2_pokemonstat": return Pokeapi.Objects.Pokemon_v2_pokemonstat
    case "pokemon_v2_pokemontype": return Pokeapi.Objects.Pokemon_v2_pokemontype
    case "pokemon_v2_stat": return Pokeapi.Objects.Pokemon_v2_stat
    case "pokemon_v2_type": return Pokeapi.Objects.Pokemon_v2_type
    case "query_root": return Pokeapi.Objects.Query_root
    default: return nil
    }
  }
}

public enum Objects {}
public enum Interfaces {}
public enum Unions {}
