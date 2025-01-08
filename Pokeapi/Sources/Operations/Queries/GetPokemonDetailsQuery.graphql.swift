// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetPokemonDetailsQuery: GraphQLQuery {
  public static let operationName: String = "GetPokemonDetails"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query GetPokemonDetails($id: Int!) { pokemon_v2_pokemon(where: { id: { _eq: $id } }) { __typename name id height weight pokemon_v2_pokemonsprites { __typename sprites(path: "other.official-artwork.front_default") } pokemon_v2_pokemonspecy { __typename pokemon_v2_pokemonspeciesflavortexts( order_by: { version_id: desc } limit: 1 where: { pokemon_v2_language: { name: { _eq: "en" } } } ) { __typename flavor_text } } pokemon_v2_pokemonstats { __typename base_stat pokemon_v2_stat { __typename name } } pokemon_v2_pokemontypes { __typename pokemon_v2_type { __typename name } } pokemon_v2_pokemonabilities { __typename pokemon_v2_ability { __typename name } } pokemon_v2_pokemoncries { __typename cries(path: "latest") } } }"#
    ))

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var __variables: Variables? { ["id": id] }

  public struct Data: Pokeapi.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Query_root }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("pokemon_v2_pokemon", [Pokemon_v2_pokemon].self, arguments: ["where": ["id": ["_eq": .variable("id")]]]),
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
        .field("height", Int?.self),
        .field("weight", Int?.self),
        .field("pokemon_v2_pokemonsprites", [Pokemon_v2_pokemonsprite].self),
        .field("pokemon_v2_pokemonspecy", Pokemon_v2_pokemonspecy?.self),
        .field("pokemon_v2_pokemonstats", [Pokemon_v2_pokemonstat].self),
        .field("pokemon_v2_pokemontypes", [Pokemon_v2_pokemontype].self),
        .field("pokemon_v2_pokemonabilities", [Pokemon_v2_pokemonability].self),
        .field("pokemon_v2_pokemoncries", [Pokemon_v2_pokemoncry].self),
      ] }

      public var name: String { __data["name"] }
      public var id: Int { __data["id"] }
      public var height: Int? { __data["height"] }
      public var weight: Int? { __data["weight"] }
      /// An array relationship
      public var pokemon_v2_pokemonsprites: [Pokemon_v2_pokemonsprite] { __data["pokemon_v2_pokemonsprites"] }
      /// An object relationship
      public var pokemon_v2_pokemonspecy: Pokemon_v2_pokemonspecy? { __data["pokemon_v2_pokemonspecy"] }
      /// An array relationship
      public var pokemon_v2_pokemonstats: [Pokemon_v2_pokemonstat] { __data["pokemon_v2_pokemonstats"] }
      /// An array relationship
      public var pokemon_v2_pokemontypes: [Pokemon_v2_pokemontype] { __data["pokemon_v2_pokemontypes"] }
      /// An array relationship
      public var pokemon_v2_pokemonabilities: [Pokemon_v2_pokemonability] { __data["pokemon_v2_pokemonabilities"] }
      /// An array relationship
      public var pokemon_v2_pokemoncries: [Pokemon_v2_pokemoncry] { __data["pokemon_v2_pokemoncries"] }

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

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonspecy
      ///
      /// Parent Type: `Pokemon_v2_pokemonspecies`
      public struct Pokemon_v2_pokemonspecy: Pokeapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemonspecies }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_v2_pokemonspeciesflavortexts", [Pokemon_v2_pokemonspeciesflavortext].self, arguments: [
            "order_by": ["version_id": "desc"],
            "limit": 1,
            "where": ["pokemon_v2_language": ["name": ["_eq": "en"]]]
          ]),
        ] }

        /// An array relationship
        public var pokemon_v2_pokemonspeciesflavortexts: [Pokemon_v2_pokemonspeciesflavortext] { __data["pokemon_v2_pokemonspeciesflavortexts"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonspecy.Pokemon_v2_pokemonspeciesflavortext
        ///
        /// Parent Type: `Pokemon_v2_pokemonspeciesflavortext`
        public struct Pokemon_v2_pokemonspeciesflavortext: Pokeapi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemonspeciesflavortext }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("flavor_text", String.self),
          ] }

          public var flavor_text: String { __data["flavor_text"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat
      ///
      /// Parent Type: `Pokemon_v2_pokemonstat`
      public struct Pokemon_v2_pokemonstat: Pokeapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemonstat }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("base_stat", Int.self),
          .field("pokemon_v2_stat", Pokemon_v2_stat?.self),
        ] }

        public var base_stat: Int { __data["base_stat"] }
        /// An object relationship
        public var pokemon_v2_stat: Pokemon_v2_stat? { __data["pokemon_v2_stat"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonstat.Pokemon_v2_stat
        ///
        /// Parent Type: `Pokemon_v2_stat`
        public struct Pokemon_v2_stat: Pokeapi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_stat }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
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

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability
      ///
      /// Parent Type: `Pokemon_v2_pokemonability`
      public struct Pokemon_v2_pokemonability: Pokeapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemonability }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("pokemon_v2_ability", Pokemon_v2_ability?.self),
        ] }

        /// An object relationship
        public var pokemon_v2_ability: Pokemon_v2_ability? { __data["pokemon_v2_ability"] }

        /// Pokemon_v2_pokemon.Pokemon_v2_pokemonability.Pokemon_v2_ability
        ///
        /// Parent Type: `Pokemon_v2_ability`
        public struct Pokemon_v2_ability: Pokeapi.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_ability }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
            .field("name", String.self),
          ] }

          public var name: String { __data["name"] }
        }
      }

      /// Pokemon_v2_pokemon.Pokemon_v2_pokemoncry
      ///
      /// Parent Type: `Pokemon_v2_pokemoncries`
      public struct Pokemon_v2_pokemoncry: Pokeapi.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: any ApolloAPI.ParentType { Pokeapi.Objects.Pokemon_v2_pokemoncries }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("cries", Pokeapi.Jsonb.self, arguments: ["path": "latest"]),
        ] }

        public var cries: Pokeapi.Jsonb { __data["cries"] }
      }
    }
  }
}
