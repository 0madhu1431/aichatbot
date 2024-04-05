def generate_response(user_input):
    # Define rules for response generation
    if re.search(r'\bhi\b|\bhello\b', user_input, re.IGNORECASE):
        return "Hello! How can I assist you today?"
    elif re.search(r'\bbye\b|\bgoodbye\b', user_input, re.IGNORECASE):
        return "Goodbye! Have a great day!"
    else:
        return "I'm sorry, I didn't understand that. Can you please rephrase?"

def main():
    print("Welcome to Rule-Based Chatbot!")
    print("You can start typing your queries. Type 'exit' to end the conversation.")

    while True:
        user_input = input("You: ")
        if user_input.lower() == 'exit':
            print("Chatbot: Goodbye!")
            break
        response = generate_response(user_input)
        print("Chatbot:", response)

if __name__ == "__main__":
    main()