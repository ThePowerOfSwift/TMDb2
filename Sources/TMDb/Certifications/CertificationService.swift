import Foundation

///
/// Provides an interface for obtaining certification data from TMDb.
///
@available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
public final class CertificationService {

    private let apiClient: APIClient

    ///
    /// Creates a certificate service object.
    ///
    /// - Parameters:
    ///    - config: TMDb configuration setting.
    ///
    public convenience init(config: TMDbConfiguration) {
        self.init(
            apiClient: TMDbFactory.apiClient(apiKey: config.apiKey)
        )
    }

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    ///
    /// Returns an up to date list of the officially supported movie certifications on TMDB.
    ///
    /// [TMDb API - Movie Certifications](https://developer.themoviedb.org/reference/certification-movie-list)
    ///
    /// - Returns: A dictionary of movie certifications.
    /// 
    public func movieCertifications() async throws -> [String: [Certification]] {
        let certifications: Certifications = try await apiClient.get(endpoint: CertificationsEndpoint.movie)
        return certifications.certifications
    }

    ///
    /// Returns an up to date list of the officially supported TV certifications on TMDB.
    ///
    /// [TMDb API - TV show Certifications](https://developer.themoviedb.org/reference/certifications-tv-list)
    ///
    /// - Returns: A dictionary of TV show certifications.
    /// 
    public func tvShowCertifications() async throws -> [String: [Certification]] {
        let certifications: Certifications = try await apiClient.get(endpoint: CertificationsEndpoint.tvShow)
        return certifications.certifications
    }

}
