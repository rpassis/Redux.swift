import Foundation
import Redux
import RxSwift

class CounterStore: Publisher, Dispatcher, ObservableType {
    typealias E = CounterState

    fileprivate let store = Store<CounterState>(initialState: CounterState()) { state, action in
        switch action {
        case let action as IncrementAction:
            return CounterState(counter: state.counter + action.amount)

        case let action as DecrementAction:
            return CounterState(counter: state.counter - action.amount)

        default:
            return state
        }
    }

    func subscribe(_ subscription: @escaping (CounterState) -> Void) -> ((Void) -> Void) {
        return store.subscribe(subscription)
    }

    func dispatch(_ action: Action) {
        return store.dispatch(action)
    }
}

struct CounterState {
    let counter: Int

    init (counter: Int = 0) {
        self.counter = counter
    }
}

struct IncrementAction: Action {
    let amount: Int
}

struct DecrementAction: Action {
    let amount: Int
}
