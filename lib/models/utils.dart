class StateManager {
  static bool _updateNeeded = true;

  static init() {
    _updateNeeded = true;
  }

  static bool get updateNeeded {
    init();
    return _updateNeeded;
  }

  static set updateNeeded(bool value) {
    _updateNeeded = value;
  }
}
