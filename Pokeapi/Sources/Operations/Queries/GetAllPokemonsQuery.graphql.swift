// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllPokemonsQuery: GraphQLQuery {
  public static let operationName: String = "GetAllPokemons"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetAllPokemons { pokemon_v2_pokemon(limit: 151) { __typename name id pokemon_v2_pokemonsprites { __typename sprites(path: "other.official-artwork.front_default") } pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename name } } } }"#
    ))

  public init() {}

  public struct Data: Pokeapi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon_v2_pokemon", [Pokemon_v2_pokemon].self, arguments: ["limit": 151]),
    ] }

    /// fetch data from the table: "pokemon_v2_pokemon"
    public var pokemon_v2_pokemon: [Pokemon_v2_pokemon] { __data["pokemon_v2_pokemon"] }

    /// Pokemon_v2_pokemon
    ///
    /// Parent Type: `Pokemon_v2_pokemon`
    public struct Pokemon_v2_pokemon: Pokeapi.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
        .field("id", Int.self),
        .field("pokemon_v2_pokemonsprites", [Pokemon_v2_pokemonsprite].self),
        .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
      ] }

      public var name: String { __data["name"] }
      public var id: Int { __data["id"] }
      /// An array relationship
      public var pokemon_v2_pokemonsprites: [Pokemon_v2_pokemonsprite] { __data["pokemon_v2_pokemonsprites"] }
      /// An array relationship
      public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonsprite
      ///
      /// Parent Type: `Pokemon_v2_pokemonsprites`
      public struct Pokemon_v2_pokemonsprite: Pokeapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemonsprites }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("sprites", Pokeapi.Jsonb.self, arguments: ["path": "other.official-artwork.front_default"]),
        ] }

        public var sprites: Pokeapi.Jsonb { __data["sprites"] }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype
      ///
      /// Parent Type: `Pokemon_v2_pokemontype`
      public struct Pokemon_v2_pokemontype: Pokeapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemontype }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_v2_type", Pokemon_v2_type?.self),
        ] }

        /// An object relationship
        public var pokemon_v2_type: Pokemon_v2_type? { __data["pokemon_v2_type"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemontype.Pokemon_v2_type
        ///
        /// Parent Type: `Pokemon_v2_type`
        public struct Pokemon_v2_type: Pokeapi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_type }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }
    }
  }
}
