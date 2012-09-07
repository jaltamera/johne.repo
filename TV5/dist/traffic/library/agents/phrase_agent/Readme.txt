Description:
  The helper agent to create an agent that makes a claim for phrases or tokens. Typically these kinds of agents
  have only one policy that consists of some tokens and grammatical conoditions. As well, their execution string
  are almost empty. This agent provides a common part of policies.

  For example the following GREETING PhraseAgent

  AgentName: GREETING
  Condition: 'hello'|('kon' 'nichiha')|'bonjour'

  is equivalent to the AASAP agent which has the following policies.

  AgentName:
  P1: 'hello'|('kon' 'nichiha')|'bonjour'
    { action: ''}
  P2: P1+

Files:
- phrase1.opal
  OPAL file.
- phrase1.smp
  sample file.

Integration Notes:
  None.

Custom Agent:
- com.dejima.library.phrase.PhraseAgent

