<script setup lang="ts">
  import EarlyAccess from './EarlyAccess.vue';

  const emit = defineEmits<{
    'banner-message': [message: string, type: string]
  }>()

  const passthruEvent = (message:string, type: string) => { 
    emit('banner-message', message, type);
  }
</script>

<template>
  <div class="container">
    <div class="headline">
  <h2>Questions you may have</h2>
  <p class="centered sub">To be honest, no one has really asked me any questions about this yet. So please enjoy these <b>hypothetically asked questions.</b></p>
    </div>

  <div class="question">
    <h3 class="q">Ugh, is this an AI thing?</h3>
    <p class="a">Sort of! But maybe not in the way you’d imagine. I am exploring ethical uses for LLMs. There are lots of people who believe that because of the training cost and possible use of copyrighted material in the creation of these models, that there is no ethical way to use an LLM. If you hold that belief very strongly, this is probably not for you. If you think it <em>may</em> be possible to use this technology ethically, you may have more questions.</p>
  </div>
  <div class="question">
    <h3 class="q">Okay, how are you using AI, Mr. Ethical?</h3>
    <p class="a">It’s partly about what I’m <em>not</em> doing - I’m not sending user data directly to a 3rd party LLM run by OpenAI, Anthropic or Meta. That turns out not to be a good way to extract deals from emails. I tried it on my own emails! Even state of the art LLMs would mistake URL signatures for OCR encoding errors and change the letters!<br/><br/>It would summarize an email like it was half paying attention while looking at Tiktok on its phone. So instead, my pipeline first uses <a href="https://www.crummy.com/software/BeautifulSoup/bs4/doc/">Beautiful Soup</a> to parse the promotional offers, extracting enough context to understand what the link might be about.</p>
  </div>

  <div class="question">
    <h3 class="q">That’s not AI. Where does the AI fit in?</h3>
    <p class="a">I take those deal details and send them to an LLM <b>running on hardware that I control</b>. Examples of deal snippets might be “50% off shipping when you buy 3 mattresses,” or “BUY NOW.” Sometimes the deal snippets are pretty bad because the extractor I wrote got confused. My bad.<br/><br/>You don’t need a lot of computing horsepower to boil those little deal snips down to sentences. In my local dev environment, I am using <a href="https://huggingface.co/meta-llama/Llama-3.1-8B">llama3.1-8b</a>, which is an open source model that runs on my 2019 era desktop via Ollama. <br/><br/> Most of the big name 3rd party providers like OpenAI and Meta have sent strong signals that they will not respect the privacy of your data, so I will not use them.</p>
</div>

  <div class="question">
    <h3 class="q">Wait, so you are DELETING my promotional emails?</h3>
    <p class="a flex">
      <img src="https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.imgflip.com%2F7py3ft.jpg&f=1&nofb=1&ipt=95443ec9ad005e502d08a0a6a2d8ba9414b91e1072d86ed8f79b6b30d70226f7" width="300"/> <br/>
      <span class="a">
      Gmail uses a labeling scheme to decide what goes in your inbox. When your 
      promotional emails are ingested, I remove Google’s inbox tag, and I 
      add a special tag for a new folder. In Gmail, you will notice a folder 
      called “Dealboxxed Promotions” with all your old
      promotional emails. All your garbage, safe and sound. Also, in case I
      make a mistake, it’s easy to fix - just check your special folder in Gmail.
      </span>
    </p>
  </div>

  <div class="question">
    <h3 class="q">How can you tell what emails are promotional?</h3>
    <p class="a">
    I don’t have to! There are plenty of heuristics I could use: the sending service, tracking pixels in the mail, the content of the links themselves. But Gmail already tags promotional emails. Check out <a href="https://developers.google.com/workspace/gmail/api/guides/labels">Gmail’s API docs</a> if you are curious.
  <br/><br/>
  So sign up for that email list! Get that 20% off your new sectional couch and do not worry about polluting your inbox!
    </p>
  </div>

  <div class="question">
    <h3 class="q">Ugh, so this only works with Gmail?</h3>
    <p class="a">Yup. For now. Maybe that will change, maybe it won’t!</p>
  </div>


  <div class="question">
    <h3 class="q">Why wouldn’t I just use Gmail’s ‘Promotions’ tab?</h3>
    <p class="a">If you like that, you should use it! I personally feel like I have 4 inboxes to clean out. So auto-archiving promotions works for me. Maybe it doesn’t work for you. That’s okay. It’s okay for us to be different people with different preferences.</p>
  </div>

  <div class="question no-border">
    <h3 class="q">Was this FAQ written with AI?</h3>
    <p class="a">Nope. Flesh and fingers and brain and markdown. Ew. Gross. And it’s not a FAQ. These are not frequently asked questions. More like hypothetical objections.</p>
  </div>

    <EarlyAccess class="custom-ea" @banner-message="passthruEvent"/>
  </div>

</template>

<style scoped>
h2 {
  font-size: 2.5em;
  text-align:center;
  padding-top: 4rem;
}

div.container {
  width: 100%;
  margin: 0 auto 0 auto;
  background-color: #faf8f5;
  padding-bottom: 4rem;
  div, p {
    margin: 0 auto 0 auto;
  }
  p.sub, p.sub > b {
    color: #676f7e;
    max-width: 620px;
  }

  p {
    font-size: 1.2em;
  }
  .a {
    color: rgb(103,111,126);
  }

  div.headline {
    margin-bottom: 4rem;
  }

  h3 {
    font-size: 1.66em;
  }

  div.question {
    border-bottom: 1px solid rgb(231, 226, 218);
    padding-bottom: 1.25rem;
    margin-bottom: 1.25rem;
    max-width: 80%;
  }

  div.question.no-border {
    margin-bottom: 3.25rem;
    border-bottom: none;
  }

  .a.flex {
    display: flex;
    gap: 1rem;
  }

  .custom-ea {
    margin-bottom: 4rem;
    width: 100%;
  }

  @media (max-width:599px) {
    p.centered.sub {
      max-width: 90%;
    }
    .a.flex {
      img {
        margin: 0 auto 0 auto;
        margin-top: 1rem;
        width: 100%;
      }
      flex-direction: column;
      gap: 0;
    }
  }
}

</style>
