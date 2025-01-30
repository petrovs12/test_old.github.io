---
id: 5keifzuiub8g5i0s3cv1bxs
title: Original Draft
desc: ""
updated: 2024-12-15T22:35
created: 1732207270338
---
&lt;%_
/_

```js\*/
try {
  if (window.ewm) { //window.ewm is populated by the Excalidraw Writing Machine script
    const systemMessage = 
      "You are an expert in academic writing with a strong command of structure, clarity, and logical argumentation. " +
      "Your task is to transform the provided draft into a well-organized, insightful academic article. " +
      "Ensure that the final article is clear, coherent, and follows a logical structure aligned with the draft. " +
      "Integrate all provided illustrations, key ideas and insights from the draft while enhancing them with examples and smoother transitions. " +
      "Return the article in Markdown format, preserving all provided image embed links exactly as they are to avoid any disruption. " +
      "DO NOT MODIFY THE IMAGE LINKS!";
    const userPrompt = 
      "Write a well-structured academic article based on the draft provided below. " +
      "Adhere closely to the content and logical flow of the draft, but extend and embellish the text by " +
      "including relevant examples, adding transitions and connecting text to ensure smooth progression of the argument, and " +
      "enhancing details that improve readability and clarity. If provided in the draft, include the provided image links in the final article. " +
      "Maintain a professional and insightful tone suitable for an academic audience. " +
      "Begin the article with an Abstract and end with a Conclusions section. The Conclusions should " +
      "provide practical, actionable takeaways and a call to action for the reader." +
      "\n\n---\n\n" + window.ewm;
    const model =  "chatgpt-4o-latest"; //"chatgpt-4o-latest", "gpt-4o-mini"; pricing: https://openai.com/api/pricing/
    const maxReturnTokens = 16384; //For info on limits, see: https://platform.openai.com/docs/models
    const maxOutgoingCharacters = 40000;
    
    const response = await tp.ai.chat(
      userPrompt,
      model,
      systemMessage,
      maxReturnTokens,
      maxOutgoingCharacters
    );

    window.ewmResponse = {systemMessage, userPrompt, model, maxReturnTokens, maxOutgoingCharacters, response};

    if (response) {
      tR += response;
    }
  }
} catch (e) {
  new Notice(`Error processing the article: ${e}`);
  console.log(e);
}
/*
```

\*/

%>

## 

### 🌐<https://fburl.com/code/bkaqs4u5>

xfb_qrt_get_csbqrt_mde_estimation

power estimator
<https://fburl.com/code/9crmb2ig>

🌐<https://fburl.com/code/pbx02snw>
power calculator for csbqrt- doesnt take 
into account the batch

csbqrt_sav_history_for_future_experiments_v2

power estimator- make 
it aware of the days-correction
<https://www.internalfb.com/intern/anp/view/?id=4360241>

Modify the formula

```
return (

c_events + c_users * days * (1 + d_sqrt / np.sqrt(days)) * (

(4 * (2 * np.exp(-3 * days / t_evolve) + 6 * days / t_evolve - 2)) / (6 * days / t_evolve)**2

)

) / (segments * days)
```

## need to can we modify those thing

excalidraw-plugin: parsed
tags:

- excalidraw

* * *

Needed data to add:
conversion events, exposed users, days, t_evolve, segments, days
from <https://fburl.com/code/qn9we3rt>

### get number of exposed users (?)

we can use 

```
 AS (
        SELECT
            *
        FROM <INPUT:training_data_bipartite>
        INNER JOIN (
            SELECT
                unit_id campaign_group_id,
                cluster_id
            FROM <INPUT:clustering_result_table>
        )
            USING (campaign_group_id)
    ),
```

to get number of exposed users.

### Get number of conversions, impressons (?)

we can see all (impressions, conversions, clicks, non-billable) from 
<https://fburl.com/code/b8tq7xml>
but again need to join by the campaign group id...

==⚠  Switch to EXCALIDRAW VIEW in the MORE OPTIONS menu of this document. ⚠== You can decompress Drawing data with the command palette: 'Decompress current Excalidraw file'. For more info check in plugin settings under 'Saving'

# Excalidraw Data

## Text Elements

Data sources for 
users, impressions, conversions

 ^e7cink4x

most exist in the clustering tables
 ^87id8eAE

%%

## Drawing

```compressed-json
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

hlgAqZAEa4QpmxRALFIAA===
```

%%

