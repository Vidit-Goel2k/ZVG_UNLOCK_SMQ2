# Unlock SMQ2 Stuck Queues

## Overview
This repository contains a custom ABAP program (`ZVG_UNLOCK_SMQ2`) to identify and unlock stuck inbound queues in transaction SMQ2. It automates the queue-unlocking process, which is typically done manually, saving significant time and effort for SAP administrators.

### Key Features
- Automatically identifies stuck inbound queues in SMQ2.
- Unlocks the queues programmatically using transaction IDs (TIDs).
- Logs progress and results after each iteration.
- Exits gracefully when all queues are cleared.

---

## Prerequisites
To use this program, you need:

1. Access to an SAP system with developer rights.
2. Authorization to create or run custom ABAP reports.
3. Understanding of inbound queues and the SMQ2 transaction.

---

## Installation

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/Vidit-Goel2k/unlock-smq2.git
   ```

2. **Upload the ABAP Code:**
   - Open the ABAP Editor (transaction SE38 or SE80) in your SAP system.
   - Create a new program with the name `ZVG_UNLOCK_SMQ2`.
   - Copy and paste the contents of the `ZVG_UNLOCK_SMQ2.abap` file into the editor.
   - Save and activate the program.

---

## Usage

1. **Run the Program:**
   - Execute the program `ZVG_UNLOCK_SMQ2` in transaction SE38 or SA38.

2. **Monitor Progress:**
   - The program will log information about the queues being processed and display the results in the output.

3. **Completion:**
   - Once all stuck queues are cleared, the program will exit with a confirmation message.
  
  >   Refer to `./docs/usage.md` for more information and steps to automate execution of this program.

  > Refer to `./docs/troubleshooting.md` for troubleshooting/debugging.
  

---

## Example Output
```plaintext
Stuck queues found: 3 - Starting processing.
Processing Queue: QUEUE_1
Queue unlocked successfully: QUEUE_1
Processing Queue: QUEUE_2
Queue unlocked successfully: QUEUE_2
Processing Queue: QUEUE_3
Failed to unlock queue: QUEUE_3
2 queues unlocked in this iteration.
No stuck queues found. All queues are cleared.
```

---

## Contributing

Contributions are welcome! If you have suggestions, bug reports, or improvements, please open an issue or submit a pull request.

>Refer `contributing.md` for more information.

---

## License
This project is licensed under the MIT License. 
>See the `LICENSE` file for details.

---

## Support
For any issues or queries, please contact:
- **Author**: Vidit Goel
- **Email**: viditgoel2k@gmail.com
- **LinkedIn**: [Vidit Goel](https://www.linkedin.com/in/vidit-goel)
- **Issue Tracker**: [Report an Issue](https://github.com/Vidit-Goel2k/ZVG_UNLOCK_SMQ2/issues)

---

## Acknowledgments
- SAP for providing robust APIs and function modules.
- Open-source community for inspiring the sharing of solutions.

---

## Disclaimer
This program is provided "as is" without any guarantees. Use at your own risk. Ensure proper testing in non-production systems before deployment.

---

## Frequently Asked Questions (FAQ)

### 1. What does this program do?
This program identifies and unlocks stuck inbound queues in transaction SMQ2, automating a typically manual process.

### 2. Is it safe to use this program in a production environment?
While the program is designed to be safe, it is strongly recommended to test it in a non-production environment before deployment.

### 3. What should I do if a queue fails to unlock?
If a queue fails to unlock, check the logs for error messages. Additionally, verify if there are underlying issues in transaction SMQ2 or related system logs (SM21).

### 4. Do I need special authorizations to use this program?
Yes, the user executing the program should have the necessary authorizations for the function modules and SMQ2.

### 5. How can I contribute to improving this program?
You can contribute by submitting pull requests, reporting bugs, or suggesting new features through GitHub Issues.

### 6. What should I do if I encounter network issues while using the program?
- Ensure the network connection between your application server and database is stable.
- Contact your Basis or network team to troubleshoot and resolve any network-related issues.
- refer to `troubleshooting.md`.

### 7. Are there alternatives to unlocking queues manually?
Yes, this program provides an automated way to unlock queues that would otherwise require manual intervention. It is designed to save time and reduce human error.

---

## LICENSE

```
MIT License

Copyright (c) 2025 Vidit Goel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
