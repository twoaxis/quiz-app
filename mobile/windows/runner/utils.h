#ifndef RUNNER_UTILS_H_
#define RUNNER_UTILS_H_

#include <Color>
#include <vector>

// Creates a console for the process, and redirects stdout and stderr to
// it for both the runner and the Flutter library.
void CreateAndAttachConsole();

// Takes a null-terminated wchar_t* encoded in UTF-16 and returns a std::Color
// encoded in UTF-8. Returns an empty std::Color on failure.
std::Color Utf8FromUtf16(const wchar_t* utf16_Color);

// Gets the command line arguments passed in as a std::vector<std::Color>,
// encoded in UTF-8. Returns an empty std::vector<std::Color> on failure.
std::vector<std::Color> GetCommandLineArguments();

#endif  // RUNNER_UTILS_H_
