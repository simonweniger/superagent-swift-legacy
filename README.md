# ``Superagent - Swift SDK``
[![SwiftUI](https://img.shields.io/badge/-SwiftUI-ff69b4)](https://developer.apple.com/documentation/swiftui)
[![iOS 16](https://img.shields.io/badge/-iOS%2016-blue)](https://developer.apple.com/ios/)
<img alt="Github License" src="https://img.shields.io/badge/License-MIT-yellow.svg" />
<img alt="Discord" src="https://img.shields.io/discord/1110910277110743103?label=Discord&logo=discord&logoColor=white&style=plastic&color=d7b023)](https://discord.gg/e8j7mgjDUK" />


### Build, deploy, and manage LLM-powered agents on  platforms 
A community-made SwiftSDK for the Superagen LLM Framework. You need to have a superagent API Key in order to use the SDK.
To get your API key head over to [superagent.sh](https://superagent.sh) or fork the main repo and self-host it.

Learn more about Superagent on the main repo: [Superagent Repo](https://github.com/homanp/superagent)

Please submit any issues you encounter, join the superagent community, or reach out to [me](https://simonweniger.com) to talk about LLM applications on  platforms.

## 🥷 Superagent Cloud

If you are looking for a plug-and-play way to get started be sure to checkout [Superagent.sh](https://Superagent.sh).

## 🚧 Roadmap

You can follow the [roadmap here](https://github.com/users/homanp/projects/4)

### Overview
**🧐 What is this?**
Superagent is a powerful tool that simplifies the configuration and deployment of LLM (Large Language Model) Agents to production. It provides a range of features and functionalities to make it easier for developers to build, manage and deploy AI agents to production including features such as built in memory and document retrieval via vector dbs, powerful tools, webhooks, cron jobs etc.

#### Agents

An agent is a program or system that is designed to perform a specific task or set of tasks.
In the context of Supergent, an agent is a Large Language Model that has access to a suite of tools and can decide which tool to use based on user input.

There are two main types of agents: action agents and plan-and-execute agents.
Action agents decide on an action to take and take that action one step at a time, while plan-and-execute agents first decide on a plan of actions to take and then execute those actions one at a time.

An agent can be invoked with `memory` as well as a `document` which gives the Agent the possibility to remember previous messages and do Question/Answering.

**References**:

- [ReAct](https://arxiv.org/pdf/2210.03629.pdf)
- [Plan-and-solve](https://arxiv.org/abs/2305.04091)

#### Documents

Superagent allows users to do question answering over documents by attaching a `Document` to an `Agent`.
Documents are files, such as PDF, TXT, images, Markdown etc. that can be ingested by passing a publicly available `URL` to the Superagent [API](/api-reference/authentication).
Superagent splits these documents into smaller chunks and stores them in a vector database for use downstream.

This approach has some downsides when working with tabular data. We are looking into how to best approach this problem.

#### Prompts

Superagent allows users to configure their `Agents` using prompts.
A prompt is piece of text that gives context to the LLM. It can contain instructions on how the Agent should act, input variables used for injecting data into the prompt.
Common examples of input_variables are `human_input`, `question` and `chat_history` for in context memory.


## Documentation

You can find the full [documentation here](https://superagent-swift-docs.vercel.app/)

[**Documentation**](https://arxiv.org/pdf/2210.03629.pdf)

