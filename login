#include <iostream>
#include <string>
#include <unordered_map>

using namespace std;

class UserAuth {
private:
    unordered_map<string, string> users;
    string currentUser;

public:
    UserAuth() {
        users["admin@example.com"] = "password123";
    }

    bool login(const string& email, const string& password) {
        if (users.find(email) != users.end() && users[email] == password) {
            currentUser = email;
            cout << "Zalogowano: " << email << endl;
            return true;
        }
        cout << "Błąd logowania!" << endl;
        return false;
    }

    void logout() {
        cout << "Wylogowano: " << currentUser << endl;
        currentUser = "";
    }

    string getCurrentUser() {
        return currentUser;
    }
};

void showMenu() {
    cout << "1. Zaloguj się\n2. Wyloguj\n3. Wyjście\nWybierz opcję: ";
}

int main() {
    UserAuth auth;
    int choice;
    string email, password;

    while (true) {
        showMenu();
        cin >> choice;
        cin.ignore();
        switch (choice) {
            case 1:
                cout << "Email: ";
                getline(cin, email);
                cout << "Hasło: ";
                getline(cin, password);
                auth.login(email, password);
                break;
            case 2:
                auth.logout();
                break;
            case 3:
                return 0;
            default:
                cout << "Nieprawidłowy wybór!" << endl;
        }
    }
}
