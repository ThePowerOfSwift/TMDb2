import Foundation

///
/// A model representing a collection of video images for a movie or TV show.
///
public struct VideoCollection: Identifiable, Codable, Equatable, Hashable {

    ///
    /// Movie or TV show identifier.
    ///
    public let id: Int

    ///
    /// List of videos.
    ///
    public let results: [VideoMetadata]

    ///
    /// Creates a video collection object.
    ///
    /// - Parameters:
    ///    - id: Movie or TV show identifier.
    ///    - results: Videos.
    ///
    public init(id: Int, results: [VideoMetadata]) {
        self.id = id
        self.results = results
    }

}
