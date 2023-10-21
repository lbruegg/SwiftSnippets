import RealmSwift

protocol DBClientProtocol {

    typealias SetHandler = (_ dataSource: [Any]) -> Void

    func deleteAll()
    func deleteAll(of type: Object.Type)

    func delete<T: Object>(item: T)

    func getAll<T: Object>(model: T.Type) -> [T]

    func add<T: Object>(item: T, type: T.Type)

    func setUpdateHandler<T: Object>(type: T.Type, onUpdate setHandler: @escaping SetHandler)

    func update<T: Object>(type: T.Type)
}
