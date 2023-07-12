# ``superagent``

# Concepts
These are the core concepts that Superagent uses to create LLM Agents. It contains practical examples as well as links to papers or sources.

## Agents
An agent is a program or system that is designed to perform a specific task or set of tasks. In the context of Supergent, an agent is a Large Language Model that has access to a suite of tools and can decide which tool to use based on user input.
There are two main types of agents: action agents and plan-and-execute agents. Action agents decide on an action to take and take that action one step at a time, while plan-and-execute agents first decide on a plan of actions to take and then execute those actions one at a time.
An agent can be invoked with memory as well as a document which gives the Agent the possibility to remember previous messages and do Question/Answering.


## Documents
Superagent allows users to do question answering over documents by attaching a Document to an Agent. Documents are files, such as PDF, TXT, images, Markdown etc. that can be ingested by passing a publicly available URL to the Superagent API. 
Superagent splits these documents into smaller chunks and stores them in a vector database for use downstream.
This approach has some downsides when working with tabular data. We are looking into how to best approach this problem. 
This is a community-made SwiftSDK for the Superagen LLM Framework. You need to have a superagent API Key in order to use the SDK. 

## Prompts
Superagent allows users to configure their Agents using prompts. A prompt is piece of text that gives context to the LLM. It can contain instructions on how the Agent should act, input variables used for injecting data into the prompt. Common examples of input_variables are human_input, question and chat_history for in context memory.



