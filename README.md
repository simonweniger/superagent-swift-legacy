# ``Superagent - Swift SDK``
## Build, deploy, and manage LLM-powered agents (superagent.sh)[htpps://superagent.sh]
### A community made SwiftSDK for the Superagen LLM Framework.


<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Overview

---
title: Concepts
description: "These are the core concepts that Superagent uses to create LLM Agents. It contains practical examples as well as links to papers or sources."
---

### Agents

An agent is a program or system that is designed to perform a specific task or set of tasks.
In the context of Supergent, an agent is a Large Language Model that has access to a suite of tools and can decide which tool to use based on user input.

There are two main types of agents: action agents and plan-and-execute agents.
Action agents decide on an action to take and take that action one step at a time, while plan-and-execute agents first decide on a plan of actions to take and then execute those actions one at a time.

An agent can be invoked with `memory` as well as a `document` which gives the Agent the possibility to remember previous messages and do Question/Answering.

**References**:

- [ReAct](https://arxiv.org/pdf/2210.03629.pdf)
- [Plan-and-solve](https://arxiv.org/abs/2305.04091)

### Documents

Superagent allows users to do question answering over documents by attaching a `Document` to an `Agent`.
Documents are files, such as PDF, TXT, images, Markdown etc. that can be ingested by passing a publicly available `URL` to the Superagent [API](/api-reference/authentication).
Superagent splits these documents into smaller chunks and stores them in a vector database for use downstream.

This approach has some downsides when working with tabular data. We are looking into how to best approach this problem.

### Prompts

Superagent allows users to configure their `Agents` using prompts.
A prompt is piece of text that gives context to the LLM. It can contain instructions on how the Agent should act, input variables used for injecting data into the prompt.
Common examples of input_variables are `human_input`, `question` and `chat_history` for in context memory.


## Initialization

To use this SDK, you need to initialize it using your authentication token:

```swift
let superagent = SuperagentSDK(authToken: "YOUR_AUTH_TOKEN")
```

## Handling Prompts

- **Getting a specific prompt**

```swift
do {
	let prompt = try await superagent.getPrompt(id: "PROMPT_ID")
	// handle prompt data
} catch {
	// handle error
}
```

- **Listing all prompts**

```swift
do {
	let prompts = try await superagent.listPrompts()
	// handle prompts data
} catch {
	// handle error
}
```
- **Deleting a prompt**

```swift
do {
	let response = try await superagent.deletePrompt(id: "PROMPT_ID")
	 // handle response
} catch {
	 // handle error
}
```

- **Updating a prompt**

```swift
do {
	let response = try await superagent.updatePrompt(id: "PROMPT_ID", name: "NEW_NAME", inputVariables: ["var1", "var2"], template: "TEMPLATE")
	// handle response
} catch {
	// handle error
}
```

- **Creating a prompt**

```swift
do {
	let response = try await superagent.createPrompt(name: "NAME", inputVariables: ["var1", "var2"], template: "TEMPLATE")
	// handle response
} catch {
	// handle error
}
```

## Handling Documents

- **Getting a specific document**

```swift
do {
	let document = try await superagent.getDocument(id: "DOCUMENT_ID")
	// handle document data
} catch {
	// handle error
}
```
- **Listing all documents**

```swift
do {
	let documents = try await superagent.listDocuments()
	// handle documents data
} catch {
	// handle error
}
```
- **Deleting a document**

```swift
do {
	let response = try await superagent.deleteDocument(id: "DOCUMENT_ID")
	 // handle response
} catch {
	 // handle error
}
```

- **Creating a document**

```swift
do {
	let url = URL(string: "https://example.com/document.pdf")!
	let response = try await superagent.createDocument(name: "NAME", url: url, type: .pdf)
	// handle response
} catch {
	// handle error
}
```

## Handling Agents

- **Getting a specific agent**

```swift
do {
	let agent = try await superagent.getAgent(id: "AGENT_ID")
	// handle agent data
} catch {
	// handle error
}
```
- **Listing all agents**

```swift
do {
	let agents = try await superagent.listAgents()
	// handle agents data
} catch {
	// handle error
}
```
- **Deleting an agent**

```swift
do {
	let response = try await superagent.deleteAgent(id: "AGENT_ID")
	 // handle response
} catch {
	 // handle error
}
```

- **Creating an agent**

```swift
do {
	let llmModel = LLMModel(provider: .openai, model: "gpt-3.5-turbo", apiKey: "API_KEY")
	let response = try await superagent.createAgent(name: "AGENT_NAME", llm: llmModel, hasMemory: true)
	// handle response
} catch {
	// handle error
}
```

- **Creating an agent prediction**

```swift
do {
	let response = try await superagent.createAgent(id: "AGENT_ID", input: "Your Input", hasStreaming: true)
	// handle response
} catch {
	// handle error
}
```

## Handling AgentDocuments

- **Getting all documents from an agent**

```swift
do {
	let agentDocuments = try await superagent.getAgentDocuments()
	// handle agentDocuments data
} catch {
	// handle error
}
```

- **Adding a Document to an Agent**

```swift
do {
	let response = try await superagent.createAgentDocument(documentId: "DOCUMENT_ID", agentId: "AGENT_ID")
	// handle response
} catch {
	// handle error
}
```

- **Delete a Document from an Agent**

```swift
do {
	let response = try await superagent.deleteAgentDocument(agentDocumentId: "AGENT_DOCUMENT_ID")
	// handle response
} catch {
	// handle error
}
```

## Handling Tools

- **Getting a specific tool**

```swift
do {
	let tool = try await superagent.getTool(id: "TOOL_ID")
	// handle tool data
} catch {
	// handle error
}
```

- **Listing all tools**

```swift
do {
	let tools = try await superagent.listTools()
	// handle tools data
} catch {
	// handle error
}
```
- **Deleting a tool**

```swift
do {
	let response = try await superagent.deleteTool(id: "TOOL_ID")
	 // handle response
} catch {
	 // handle error
}
```

- **Creating a tool**

```swift
do {
	let metadata = ["key": "value"]
	let response = try await superagent.createTool(name: "Tool Name", type: .search, metadata: metadata)
	// handle response
} catch {
	// handle error
}
```

Note: If in error cases, if the function returns a `SuperagentError`, it usually means that the operation failed on server side. Use `.localizedDescription` to get a human-readable error message.
