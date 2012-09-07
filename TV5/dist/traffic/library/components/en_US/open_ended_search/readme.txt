Description

The Open ended search sub-network will return the following XML:

<oesearch><site>URL</site></oesearch> 

Where URL may be Yahoo, Google, Dictionary, Thesaurus, Acronym finder, Ask Jeeves, or any specified URL.

This can be a generally useful addition to any application that can display web content. 

By adding the following policy to the top agent in your network, 
your network will always default to Ask Jeeves searches if no other alternative is available.

DEFAULT:
  true
  {action: setTag('site'), 'http://www.ask.com/main/askjeeves.asp?ask=',  
     get(GETINPUT,'INPUT')}
;


Integration

In merging it with your networks, make sure that you assign a lower priority to the policy calling this subnetwork.


Custom Agents

com.dejima.core.agents.GetInputAgent

The GetInputAgent is also useful if you need to include the whole input in your actuation, but do not want the agent to claim anything.
